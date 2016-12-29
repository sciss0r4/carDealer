using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SalonSamochodowy.Shared.Constants
{
    public class SprocNames
    {
        private const string _getWorker = "dbo.usp_GetWorker";
        private const string _userExists = "dbo.usp_UserExists";
        private const string _passwordIsCorrect = "dbo.usp_PasswordIsCorrect";
        private const string _addClient = "dbo.usp_AddClient";
        private const string _getClientsNamesByPattern = "dbo.usp_GetClientsNamesByPattern";
        private const string _getClientInfoById = "dbo.usp_GetClientInfoById";
        private const string _getUserPermissionsAndName = "dbo.usp_GetUserPermissionsAndName";
        private const string _addCar = "dbo.usp_AddCar";
        private const string _getAllBrands = "dbo.usp_GetAllBrands";
        private const string _getModelsForBrandId = "dbo.usp_GetModelsForBrandId";
        private const string _getPaintsForModelId = "dbo.usp_GetPaintsForModelId";
        private const string _getAllCarBodies = "dbo.usp_GetAllCarBodies";
        private const string _getEngineFullNamesForModelId = "dbo.usp_GetEngineFullNamesForModelId";
        private const string _getAllConfigurationOptions = "dbo.usp_GetAllConfigurationOptions";
        private const string _getAllCarModelsWithBrands = "dbo.usp_GetAllCarModelsWithBrands";
        private const string _getAllCarStatuses = "dbo.usp_GetAllCarStatuses";
		private const string _getMatchingCars = "dbo.usp_GetMatchingCars";
        private const string _addOrder = "dbo.usp_AddOrder";
        private const string _getOrdersForClientId = "dbo.usp_GetOrdersForClientId";
        private const string _getAllCars = "dbo.usp_GetAllCars";
        private const string _deleteCar = "dbo.usp_DeleteCar";
        private const string _getOrderData = "dbo.usp_GetOrderData";
        private const string _getCarsByVIN = "dbo.usp_GetCarsByVIN";
        private const string _getCarOptionsForCarID = "dbo.usp_GetCarOptionsForCarID";
        private const string _addService = "dbo.usp_AddService";
        private const string _getAllServices = "dbo.usp_GetAllServices";

        public static string GetAllServices
        {
            get { return _getAllServices; }
        } 


        public static string AddService
        {
            get { return _addService; }
        } 

        public static string GetCarOptionsForCarID
        {
            get { return _getCarOptionsForCarID; }
        } 


        public static string GetCarsByVIN
        {
            get { return _getCarsByVIN; }
        } 


        public static string GetOrderData
        {
            get { return _getOrderData; }
        } 


        public static string DeleteCar
        {
            get { return _deleteCar; }
        }

        public static string GetAllCars
        {
            get { return _getAllCars; }
        }

        public static string GetOrdersForClientId
        {
            get { return _getOrdersForClientId; }
        } 


        public static string AddOrder
        {
            get { return _addOrder; }
        } 


        public static string GetMatchingCars
        {
            get { return _getMatchingCars; }
        } 

        public static string GetAllCarStatuses
        {
            get { return _getAllCarStatuses; }
        } 

        public static string GetAllCarModelsWithBrands
        {
            get { return _getAllCarModelsWithBrands; }
        } 

        public static string GetAllConfigurationOptions
        {
            get { return _getAllConfigurationOptions; }
        } 


        public static string GetEngineFullNamesForModelId
        {
            get { return _getEngineFullNamesForModelId; }
        } 


        public static string GetAllCarBodies
        {
            get { return _getAllCarBodies; }
        } 


        public static string GetPaintsForModelId
        {
            get { return _getPaintsForModelId; }
        } 


        public static string GetModelsForBrandId
        {
            get { return _getModelsForBrandId; }
        }

        public static string GetAllBrands
        {
            get { return _getAllBrands; }
        } 

        public static string GetUserPermissionsAndName
        {
            get { return _getUserPermissionsAndName; }
        } 


        public static string GetClientInfoById
        {
            get { return _getClientInfoById; }
        } 

        public static string GetClientsNamesByPattern
        {
            get { return _getClientsNamesByPattern; }
        } 

        public static string UserExists
        {
            get { return _userExists; }
        } 

        public static string GetWorker
        {
            get { return _getWorker; }
        }

        public static string PasswordIsCorrect
        {
            get { return _passwordIsCorrect; }
        } 

        public static string AddClient
        {
            get { return _addClient; }
        }

        public static string AddCar
        {
            get { return _addCar; }
        }

    }
}
